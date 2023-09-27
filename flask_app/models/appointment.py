from flask_app.config.mysqlconnection import connectToMySQL
from flask import flash
from datetime import datetime

from flask_app.models import user

class Appointments:
    DB = 'appointments_db'
    def __init__(self, data):
        self.id = data["id"]
        self.tasks = data["tasks"]
        self.date = data['date']
        self.status = data["status"]
        self.created_at = data["created_at"]
        self.updated_at = data["updated_at"]
        self.user_id = data["user_id"]
        self.user = None




# validate methods

    @staticmethod
    def validate_appointments(data):
        is_valid = True
        if len(data["tasks"]) <= 0 or len(data["status"]) <= 0 :
            is_valid = False
            flash("All fields required")
            return is_valid
        if len(data['tasks']) < 2:
            flash("tasks must be at least 2 characters")
            is_valid = False

        if len(data['date']) < 1 :
            flash("date must be at least 1 characters")
            is_valid = False
            return is_valid
        
        date1 = datetime.now()
        date2 = datetime.strptime(data['date'], '%Y-%m-%d')

        if date2 < date1:
          flash("date input is before date now")
          is_valid = False


        if len(data['status']) < 2:
            flash("status must be at least 2 characters")
            is_valid = False
        
        return is_valid
    


# others Methods

    # CREATE NEW APPOINTMENT
    @classmethod
    def create_appointment(cls, data):
        query = "INSERT INTO appointments (tasks, date, status, created_at,  user_id) VALUES (%(tasks)s, %(date)s, %(status)s, NOW(), %(user_id)s)"
        results = connectToMySQL(cls.DB).query_db(query,data)
        appointment_id_created = results  # 
        return appointment_id_created # Create returns the ID of the new appointment
    
    
    

    # # READ
    # # ONE elt
    @classmethod
    def get_appointment_with_user(cls, data):

        query = """SELECT * FROM appointments 
                   LEFT JOIN users ON appointments.user_id = users.id 
                   WHERE users.id = %(user_id)s;"""

        results = connectToMySQL(cls.DB).query_db(query, data)


        all_appointment_array = []

        for obj in results:

            appointment_instance = Appointments(obj)

            user_data = {
                "id" : obj["users.id"],
                "first_name" : obj["first_name"],
                "last_name" : obj["last_name"],
                "email" : obj["email"],
                "password" : obj["password"],
                "created_at" : obj["users.created_at"],
                "updated_at" : obj["users.updated_at"],
            }
            user_instance = user.User(user_data)
            appointment_instance.user = user_instance
            all_appointment_array.append(appointment_instance)

        return all_appointment_array





    # # READ
    # # ONE elt
    @classmethod
    def get_one(cls, data):
        query  = "SELECT * FROM appointments WHERE id = %(appointment_id)s;"

        results = connectToMySQL(cls.DB).query_db(query, data)

        return cls(results[0])
    


    # UPDATE
    @classmethod
    def update_appointment(cls, data):
        query = "UPDATE appointments SET tasks = %(tasks)s, date = %(date)s, status = %(status)s, updated_at = NOW() WHERE id = %(appointment_id)s"

        results = connectToMySQL(cls.DB).query_db(query, data)

        return  # update queries don't return anything 



    # DELETE     
    @classmethod
    def delete_appointment(cls, data):
        query = "DELETE FROM appointments WHERE id = %(appointment_id)s"

        results = connectToMySQL(cls.DB).query_db(query, data)

        return  # delete queries don't return anything






   






