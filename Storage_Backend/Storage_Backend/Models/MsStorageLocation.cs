using System;
using System.Collections.Generic;

namespace Storage_Backend.Models
{
    public partial class MsStorageLocation
    {
        public string LocationId { get; set; } = null!;
        public string? LocationName { get; set; }
    }
}
