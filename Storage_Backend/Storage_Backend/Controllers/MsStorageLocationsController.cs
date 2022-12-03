using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Storage_Backend.Models;

namespace Storage_Backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MsStorageLocationsController : ControllerBase
    {
        private readonly StorageContext _context;

        public MsStorageLocationsController(StorageContext context)
        {
            _context = context;
        }

        // GET: api/MsStorageLocations
        [HttpGet]
        public async Task<ActionResult<IEnumerable<MsStorageLocation>>> GetMsStorageLocations()
        {
            return await _context.MsStorageLocations.ToListAsync();
        }

        // GET: api/MsStorageLocations/5
        [HttpGet("{id}")]
        public async Task<ActionResult<MsStorageLocation>> GetMsStorageLocation(string id)
        {
            var msStorageLocation = await _context.MsStorageLocations.FindAsync(id);

            if (msStorageLocation == null)
            {
                return NotFound();
            }

            return msStorageLocation;
        }

        // PUT: api/MsStorageLocations/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutMsStorageLocation(string id, MsStorageLocation msStorageLocation)
        {
            if (id != msStorageLocation.LocationId)
            {
                return BadRequest();
            }

            _context.Entry(msStorageLocation).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MsStorageLocationExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/MsStorageLocations
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<MsStorageLocation>> PostMsStorageLocation(MsStorageLocation msStorageLocation)
        {
            _context.MsStorageLocations.Add(msStorageLocation);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (MsStorageLocationExists(msStorageLocation.LocationId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetMsStorageLocation", new { id = msStorageLocation.LocationId }, msStorageLocation);
        }

        // DELETE: api/MsStorageLocations/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteMsStorageLocation(string id)
        {
            var msStorageLocation = await _context.MsStorageLocations.FindAsync(id);
            if (msStorageLocation == null)
            {
                return NotFound();
            }

            _context.MsStorageLocations.Remove(msStorageLocation);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool MsStorageLocationExists(string id)
        {
            return _context.MsStorageLocations.Any(e => e.LocationId == id);
        }
    }
}
