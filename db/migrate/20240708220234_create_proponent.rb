class CreateProponent < ActiveRecord::Migration[7.1]
  def change
    create_table :proponents do |t|
      t.string  :name
      t.string  :identification_document
      t.date    :birthdate
      t.string  :address # LOGRADOURO
      t.integer :address_number #NUMERO
      t.string  :neighborhood # BAIRRO
      t.string  :city # CIDADE
      t.string  :state # ESTADO
      t.string  :postcode #CEP
      t.string  :personal_phonenumber
      t.string  :reference_phonenumber
      t.decimal :monthly_salary, precision:10, scale: 2

      t.timestamps
    end
  end
end

