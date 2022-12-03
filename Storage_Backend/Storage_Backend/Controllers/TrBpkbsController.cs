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
    public class TrBpkbsController : ControllerBase
    {
        private readonly StorageContext _context;

        public TrBpkbsController(StorageContext context)
        {
            _context = context;
        }

        // GET: api/TrBpkbs
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TrBpkb>>> GetTrBpkbs()
        {
            return await _context.TrBpkbs.ToListAsync();
        }

        // GET: api/GetLatestAgreementNumber
        [HttpGet("~/GetAgreementNumber")]
        public IActionResult GetAgreementNumber()
        {
            var result = _context.TrBpkbs.OrderByDescending(o => o.AgreementNumber).FirstOrDefaultAsync();
            string agreementNumber = string.Empty;
            if (result.Result == null) {
                return Ok("0000000001");
            }
            return Ok(getLatestAgreement(result.Result.AgreementNumber));
        }

        private string getLatestAgreement(string latestAgreement) {
            var number = int.Parse(latestAgreement) +1;

            if (number < 10) return "000000000" + number;
            else if (number < 100) return "00000000" + number;
            else if (number < 1000) return "0000000" + number;
            else if (number < 10000) return "000000" + number;
            else if (number < 100000) return "00000" + number;
            else if (number < 1000000) return "0000" + number;
            else if (number < 10000000) return "000" + number;
            else if (number < 100000000) return "00" + number;
            else if (number < 1000000000) return "0" + number;
            else if (number < 10000000000) return  "" +number;

            return string.Empty;
        }


        // GET: api/TrBpkbs/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TrBpkb>> GetTrBpkb(string id)
        {
            var trBpkb = await _context.TrBpkbs.FindAsync(id);

            if (trBpkb == null)
            {
                return NotFound();
            }

            return trBpkb;
        }

        // PUT: api/TrBpkbs/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTrBpkb(string id, TrBpkb trBpkb)
        {
            if (id != trBpkb.AgreementNumber)
            {
                return BadRequest();
            }

            _context.Entry(trBpkb).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TrBpkbExists(id))
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

        // POST: api/TrBpkbs
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TrBpkb>> PostTrBpkb(TrBpkb trBpkb)
        {
            _context.TrBpkbs.Add(trBpkb);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (TrBpkbExists(trBpkb.AgreementNumber))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetTrBpkb", new { id = trBpkb.AgreementNumber }, trBpkb);
        }

        // DELETE: api/TrBpkbs/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTrBpkb(string id)
        {
            var trBpkb = await _context.TrBpkbs.FindAsync(id);
            if (trBpkb == null)
            {
                return NotFound();
            }

            _context.TrBpkbs.Remove(trBpkb);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TrBpkbExists(string id)
        {
            return _context.TrBpkbs.Any(e => e.AgreementNumber == id);
        }
    }
}
