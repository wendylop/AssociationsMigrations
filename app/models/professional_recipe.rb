class ProfessionalRecipe < ApplicationRecord
  #Validaciones nombre
  validates :nombre,
     :presence => {:message => "You must enter a name"}, length: {minimum: 2, maximum: 50, 
     :message => "Name must be between 2 and 50 characters"}
  #Validaciones description
  validates :description,
    :presence => {:message => "You must enter a description"}, length: {minimum: 2, maximum: 50, 
    :message => "Description must be between 2 and 50 characters"}
  #Validaciones reviews
  validates :reviews,
    :presence => {:message => "You must enter a Reviews "},
    :numericality => {:only_integer => true, 
    :message => "El legajo debe ser numérica"}, 
    :uniqueness => {:message => "The reviews must be numeric"}
end

