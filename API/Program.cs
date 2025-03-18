using System;

var builder = WebApplication.CreateBuilder(args);

//  ��������� ��������� ������������
builder.Services.AddControllers();

// ��������� CORS (����� API ����� ������������ ����� � ������ ����������)
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAllOrigins",
        builder =>
        {
            builder.AllowAnyOrigin() // ��������� ��� ���������
                   .AllowAnyMethod() // ��������� ��� ������
                   .AllowAnyHeader(); // ��������� ��� ���������
        });
});

// ���� ��������� ������, ����� ����� �� http://localhost:5000/swagger � ����������� API ����� � ��������.
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// ��������� ������
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
