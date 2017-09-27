using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Wddc.DB.Framework.Repository
{
    internal class Repository<T> where T : class
    {
        internal DbSet<T> DbSet;

        internal Repository(DbContext dbContext)
        {
            this.DbSet = dbContext.Set<T>();
        }

        #region IRepository<T> Members

        internal T Insert(T entity)
        {
            DbSet.Add(entity);
            return entity;
        }

        internal virtual void Delete(T entity)
        {
            DbSet.Attach(entity);
            DbSet.Remove(entity);
        }

        internal virtual IQueryable<T> SearchFor(Expression<Func<T, bool>> predicate)
        {
            return DbSet
                .Where(predicate);
        }

        internal virtual IQueryable<T> GetAll()
        {
            return DbSet;
        }

        internal virtual void DeleteById(int id)
        {
            var t = this.GetById(id);
            Delete(t);
        }

        internal virtual T GetById(int id)
        {
            return DbSet
                .Find(id);
        }

        internal T Update(T entity)
        {
            DbSet.Attach(entity);
            return entity;
        }

        #endregion
    }
}
