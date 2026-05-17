-------------------------------
-- HOSPITAL MANAGEMENT SYSTEM
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
-- FACT 1: Valid patient-room assignment
-------------------------------
fact ValidRoomAssignment {
    all h: Hospital, p: Patient, r: Room |
        p->r in h.assigned implies
        (p in h.patients and r in h.rooms)
}

-------------------------------
-- FACT 2: One room per patient
-------------------------------
fact OneRoomPerPatient {
    all h: Hospital, p: Patient |
        lone p.(h.assigned)
}

-------------------------------
-- FACT 3: One patient per room
-------------------------------
fact OnePatientPerRoom {
    all h: Hospital, r: Room |
        lone h.assigned.r
}

-------------------------------
-- FACT 4: Valid doctor assignment
-------------------------------
fact ValidDoctorAssignment {
    all h: Hospital, p: Patient, d: Doctor |
        p->d in h.doctorOf implies
        (p in h.patients and d in h.doctors)
}

-------------------------------
-- FACT 5: Clean structure constraint
-------------------------------
fact ScopeConstraint {
    all h: Hospital |
        h.assigned in h.patients -> lone h.rooms
}

assert NoDoubleBooking {
    all h: Hospital, r: Room |
        lone h.assigned.r
}

assert SingleRoomPerPatient {
    all h: Hospital, p: Patient |
        lone p.(h.assigned)
}

assert WrongAssumption {
    all h: Hospital, p: Patient |
        some p.(h.assigned)
}


run {} for 1 Hospital, 3 Patient, 3 Room, 3 Doctor

check NoDoubleBooking for exactly 1 Hospital, 3 Patient, 3 Room
check SingleRoomPerPatient for exactly 1 Hospital, 3 Patient, 3 Room
check WrongAssumption for exactly 1 Hospital, 3 Patient, 3 Room
