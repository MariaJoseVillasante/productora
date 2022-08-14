# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# for i in (0..15)
#     i = Group.create([
#             {nombre: Faker::FunnyName.name,
#             integrantes: rand(0..6),
#             fecha_debut: Faker::Date.in_date_period,
#             tipo_grupo: rand(3..21)}
#         ])
# end

# for i in (1..10)
#     i = Concert.create([
#         {fecha: Faker::Date.in_date_period,
#         asistentes: rand(100..2000),
#         lugar: Faker::Artist.name,
#         duracion: rand(2..6),
#         group_id: rand(10..17)}
#     ])
# end
for i in (1..30)
    i = Crew.create([
        {mail: Faker::Address.city,
        nombre: Faker::FunnyName.name,
        group_id: rand(1..21)}
    ])
end