using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace RouteManagement.DB.Framework.Repository
{
    public class Repository<T> : IDisposable where T : class
    {
        public RoutingEntities dbContext;
        public DbSet<T> DbSet;

        public Repository(RoutingEntities dbContext)
        {
            this.DbSet = dbContext.Set<T>();
            this.dbContext = dbContext;
        }

        #region IRepository<T> Members

        public T Insert(T entity)
        {
            DbSet.Add(entity);
            dbContext.SaveChanges();
            return entity;
        }

        public virtual void Delete(T entity)
        {
            DbSet.Attach(entity);
            DbSet.Remove(entity);
            dbContext.SaveChanges();
        }

        public virtual IQueryable<T> SearchFor(Expression<Func<T, bool>> predicate)
        {
            return DbSet
                .Where(predicate);
        }

        public virtual IQueryable<T> GetAll()
        {
            return DbSet;
        }

        public void ReloadEntity(T entity)
        {
            dbContext.Entry(entity).Reload();
        }

        public virtual void DeleteById(int id)
        {
            var t = this.GetById(id);
            Delete(t);
        }

        public virtual T GetById(int id)
        {
            return DbSet
                .Find(id);
        }

        public T Update(T entity)
        {
            DbSet.Attach(entity);
            dbContext.Entry(entity).State = EntityState.Modified;
            dbContext.SaveChanges();
            return entity;
        }

        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    dbContext.Dispose();
                }
            }
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        #endregion
    }
}
