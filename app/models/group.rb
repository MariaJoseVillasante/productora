class Group < ApplicationRecord
    has_many :concerts, dependent: :destroy
    
    #kaminari, si no se agrega queda en 25:
    paginates_per 10

    enum :tipo_grupo, [:Girlband, :Boyband, :Band]
    #enum tipo_grupo: ["girlband", "boyband", "band"]
    
    def conciertos_este_mes
        f =[]
        d = self.concerts.map do |c|
            c.fecha.month 
        end 
        d.each do |date|
            f << date if date == Time.now.month
        end
        f.count
    end
end
