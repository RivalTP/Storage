using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Storage_Backend.Models
{
    public partial class StorageContext : DbContext
    {
        public StorageContext()
        {
        }

        public StorageContext(DbContextOptions<StorageContext> options)
            : base(options)
        {
        }

        public virtual DbSet<MsStorageLocation> MsStorageLocations { get; set; } = null!;
        public virtual DbSet<TrBpkb> TrBpkbs { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder) {}

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<MsStorageLocation>(entity =>
            {
                entity.HasKey(e => e.LocationId);

                entity.ToTable("ms_storage_location");

                entity.Property(e => e.LocationId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("location_id");

                entity.Property(e => e.LocationName)
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasColumnName("location_name");
            });

            modelBuilder.Entity<TrBpkb>(entity =>
            {
                entity.HasKey(e => e.AgreementNumber);

                entity.ToTable("tr_bpkb");

                entity.HasIndex(e => e.AgreementNumber, "IX_tr_bpkb");

                entity.Property(e => e.AgreementNumber)
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasColumnName("agreement_number");

                entity.Property(e => e.BpkbDate)
                    .HasColumnType("datetime")
                    .HasColumnName("bpkb_date");

                entity.Property(e => e.BpkbDateOn)
                    .HasColumnType("datetime")
                    .HasColumnName("bpkb_date_on");

                entity.Property(e => e.BpkbNo)
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasColumnName("bpkb_no");

                entity.Property(e => e.BranchId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("branch_id");

                entity.Property(e => e.FakturDate)
                    .HasColumnType("datetime")
                    .HasColumnName("faktur_date");

                entity.Property(e => e.FakturNo)
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasColumnName("faktur_no");

                entity.Property(e => e.LocationId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("location_id");

                entity.Property(e => e.PoliceNo)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("police_no");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
