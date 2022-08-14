class Group < ApplicationRecord
    validates :name, presence: true
    has_many :concerts, dependent: :destroy
    has_many :crews, dependent: :destroy
    
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
    def ultimo_concierto
        if self.concerts.present?
            f =[]
            d = self.concerts.map do |c|
                c.fecha
            end 
            d.each do |date|
                f << date
            end
            f.max.strftime("%Y-%B-%A")
        else
            "Sin conciertos"             
        end
        #f.max
    end
    def numero_asistentes
        asis =[]
        self.concerts.map do |c|
            asis << c.asistentes
        end
        asis
    end
    def duracion_conciertos
        duracion = []
        self.concerts.map do |c|
            duracion << c.duracion
        end
        duracion
    end
end
