-------------------------------
-- HOSPITAL MANAGEMENT SYSTEM
-- CLEAN + SIMPLE + 1 HOSPITAL ONLY
-------------------------------

sig Patient {}
sig Doctor {}
sig Room {}

sig Hospital {
    patients: set Patient,
    doctors: set Doctor,
    rooms: set Room,
    assigned: Patient -> lone Room,
    doctorOf: Patient -> lone Doctor
}

-------------------------------
-- FACT 1: Each patient belongs to hospital
-------------------------------
fact PatientBelongs {
    all h: Hospital, p: Patient |
        p in h.patients
}

-------------------------------
-- FACT 2: Each patient has at most one room
-------------------------------
fact OneRoomPerPatient {
    all h: Hospital, p: Patient |
        lone p.(h.assigned)
}

-------------------------------
-- FACT 3: Each room has at most one patient
-------------------------------
fact OnePatientPerRoom {
    all h: Hospital, r: Room |
        lone h.assigned.r
}

-------------------------------
-- FACT 4: Room assignment only for hospital patients
-------------------------------
fact ValidRoomAssign {
    all h: Hospital, p: Patient, r: Room |
        (p->r in h.assigned) implies (p in h.patients)
}

-------------------------------
-- FACT 5: Doctor assigned only to hospital patients
-------------------------------
fact ValidDoctorAssign {
    all h: Hospital, p: Patient |
        some h.doctorOf[p] implies p in h.patients
}

-------------------------------
-- ASSERTIONS (SIMPLE)
-------------------------------

assert NoDoubleBooking {
    all h: Hospital, r: Room |
        lone h.assigned.r
}

assert PatientInsideHospital {
    all h: Hospital, p: Patient |
        p in h.patients
}

assert DoctorOnlyForPatient {
    all h: Hospital, p: Patient |
        some h.doctorOf[p] implies p in h.patients
}

assert RoomMapValid {
    all h: Hospital |
        h.assigned in Patient -> lone Room
}

-------------------------------
-- RUN / CHECK (ONLY 1 HOSPITAL)
-------------------------------

run {} for 1 Hospital, 3 Patient, 3 Room, 3 Doctor

check NoDoubleBooking for 1 Hospital, 3 Patient, 3 Room
check PatientInsideHospital for 1 Hospital, 3 Patient
check DoctorOnlyForPatient for 1 Hospital, 3 Patient, 3 Room
check RoomMapValid for 1 Hospital, 3 Patient, 3 Room
