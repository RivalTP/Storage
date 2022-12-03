using Storage_Backend.Models;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
builder.Services.AddDbContext<StorageContext>(options => options.UseSqlServer(builder.Configuration.GetConnectionString("dbconn")));

builder.Services.AddCors(p => p.AddPolicy("CorsPolicy", builder =>
{
    //builder.WithOrigins("http://localhost:42").AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader();
    builder.WithOrigins("*").AllowAnyMethod().AllowAnyHeader();
}));


// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();
app.UseCors("CorsPolicy");

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
