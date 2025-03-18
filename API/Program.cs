using System;

var builder = WebApplication.CreateBuilder(args);

//  Добавляет поддержку контроллеров
builder.Services.AddControllers();

// Разрешает CORS (чтобы API могли использовать сайты и другие приложения)
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAllOrigins",
        builder =>
        {
            builder.AllowAnyOrigin() // Разрешить все источники
                   .AllowAnyMethod() // Разрешить все методы
                   .AllowAnyHeader(); // Разрешить все заголовки
        });
});

// Если запустить сервер, можно зайти на http://localhost:5000/swagger и тестировать API прямо в браузере.
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Запускает сервер
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

// Use CORS policy
app.UseCors("AllowAllOrigins");

app.UseAuthorization();

app.MapControllers();

app.Run();
