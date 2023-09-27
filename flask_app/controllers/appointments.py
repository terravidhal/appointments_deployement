from flask_app import app
from flask import render_template, redirect, request, session, flash
from flask_app.models.appointment import Appointments
from datetime import datetime




# SHOW 'CREATE_NEW_APPOINTMENT' PAGE
@app.route('/new_appointment')
def new_appointment_func():
    if "user_id" not in session:
        flash("You are log out , please logged in",'register')
        return redirect("/")
    
    return render_template("new_appointment.html")




# CREATE NEW APPOINTMENT PROCESS
@app.route('/new_appointment/process', methods=['POST'])
def create_appointment_func():
    
    data = {
        "tasks": request.form["tasks"],
        "date": request.form["date"],
        "status": request.form["status"],
        "user_id": session["user_id"],
    }

    # validate method
    if not Appointments.validate_appointments(data):
        # Make it so the data the user input isn't lost when they have an error
        session["tasks"] = request.form["tasks"]
        session["date"] = request.form["date"]
        session["status"] = request.form["status"]
        return redirect("/new_appointment")

    # save the new appointment to the db
    appointment_id =  Appointments.create_appointment(data)

    # save the new appointment id
    session["appointment_id"] = appointment_id

    # redirect
    return redirect('/dashboard')




# SHOW 'EDIT_APPOINTMENT' PAGE

@app.route('/appointment/edit/<int:appointment_id>')
def edit_appointment_func(appointment_id):

    if "user_id" not in session:
        flash("You are log out , please logged in",'register')
        return redirect("/")

    data = {
        "appointment_id" : appointment_id
    }

    appointment = Appointments.get_one(data)

    return render_template("edit_appointment.html", specific_appointment = appointment)



# EDIT(UPDATE) APPOINTMENT PROCESS

@app.route('/appointment/edit/<int:appointment_id>/process', methods=['POST'])
def edit_appointment_process(appointment_id):

    
    data = {
        "tasks": request.form["tasks"],
        "date": request.form["date"],
        "status": request.form["status"],
        "appointment_id" : appointment_id 
    }

    if not Appointments.validate_appointments(data):
        return redirect(f"/appointment/edit/{appointment_id}")

    Appointments.update_appointment(data)

    return redirect('/dashboard')






# DELETE SPECIFIC APPOINTMENT PROCESS

@app.route('/appointment/delete/<int:appointment_id>')
def delete_appointment_func(appointment_id):
    
    data = {
        "appointment_id" : appointment_id
    }

    Appointments.delete_appointment(data)

    return redirect('/dashboard')