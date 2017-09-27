using System;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web.Http;
using System.Web.Http.Description;

namespace OrderApi.Controllers
{
    public class OrdersController : ApiController
    {
        // POST: api/Orders
        [ResponseType(typeof(Order))]
        public IHttpActionResult PostOrder(Order order)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            using (OrderDBEntities context = new OrderDBEntities())
            using (var transaction = context.Database.BeginTransaction(IsolationLevel.ReadCommitted))
            {
                try
                {
                    //var number = context.SeqNumbers.Find("OrderId");
                    var number = context.Database.SqlQuery<SeqNumber>("SELECT SeqName, SeqNumber AS SeqNumber1, DateChanged FROM SeqNumber WITH (HOLDLOCK, ROWLOCK) WHERE SeqNumber.SeqName='OrderId';").First();

                    if (number.DateChanged < DateTime.Now.Date)
                    {
                        number.SeqNumber1 = 0;
                        number.DateChanged = DateTime.Now.Date;
                    }

                    number.SeqNumber1 = number.SeqNumber1 + 1;
                    context.Entry(number).State = EntityState.Modified;

                    order.OrderID = number.SeqNumber1;
                    order.SeqNoDate = int.Parse(number.DateChanged.ToString("yyyyMMdd"));
                    order.OrderDate = number.DateChanged;
                    context.Orders.Add(order);

                    context.SaveChanges();
                    transaction.Commit();
                }
                catch
                {
                    transaction.Rollback();
                    throw;
                }

                transaction.Dispose();
                context.Dispose();
            }

            return CreatedAtRoute("DefaultApi", new { id = order.OrderID }, order);
        }
    }
}