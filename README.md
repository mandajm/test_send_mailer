# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# test d'envoie d'email en back-end


    utilisation du gem lettre opener:
 a chaque user créer, l'application envoie automatiquement un email de bien venue a l'utilisateur!
#liasons entre table :user, table: event ainssi que table:attendance;

#concernant la base: postgresql:

liaisons entre les tables: 

1°) table attendance
                        
        class CreateAttendances < ActiveRecord::Migration[5.2]
          def change
            create_table :attendances do |t|
              t.belongs_to :event               #pour recuperer l'Id de l'event et l'utiliser dans le controller
              t.belongs_to :user                #pour recuperer l'Id de l'utilisateur pour recuperer l'address pour l'envoie
              t.string :stripe_customer_id
              t.timestamps
            end
          end
        end

2°) table event:

                class CreateEvents < ActiveRecord::Migration[5.2]
          def change
            create_table :events do |t|
              t.belongs_to :user        #definit comme celle ci-dessus
              t.datetime :start_date
              t.integer :duration
              t.text :description
              t.integer :price
              t.string :location
              t.timestamps
            end
          end
        end

3°) la table user: # receuillir tous les utilisateurs

        class CreateUsers < ActiveRecord::Migration[5.2]
          def change
            create_table :users do |t|
              t.string :first_name
              t.string :last_name
              t.string :email
              t.string :encrypted_password
              t.text :description
              t.timestamps
            end
          end
        end


# le model:sert à une relations entres les bases créer
 celle du project,
        class User < ApplicationRecord
            has_many :events
            
            after_create :welcome_send

            def welcome_send
              UserMailer.welcome_email(self).deliver_now
            end
          
        end


        class Attendance < ApplicationRecord
            after_create :attendance_send

            def attendance_send
                UserMailer.attendance_email(self).deliver_now
            end
        end


        class Event < ApplicationRecord
            belongs_to :user
        end

