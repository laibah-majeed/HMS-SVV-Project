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

fact PatientBelongs {
    all h: Hospital |
        h.assigned.Room in h.patients
}

fact OneRoomPerPatient {
    all h: Hospital, p: Patient |
        lone p.(h.assigned)
}

fact OnePatientPerRoom {
    all h: Hospital, r: Room |
        lone h.assigned.r
}

fact ValidRoomAssign {
    all h: Hospital, p: Patient, r: Room |
        (p->r in h.assigned) implies
        (p in h.patients and r in h.rooms)
}

fact ValidDoctorAssign {
    all h: Hospital, p: Patient, d: Doctor |
        (p->d in h.doctorOf) implies
        (p in h.patients and d in h.doctors)
}

assert NoDoubleBooking {
    all h: Hospital, r: Room |
        lone h.assigned.r
}

assert SingleRoomPerPatient {
    all h: Hospital, p: Patient |
        lone p.(h.assigned)
}

assert ValidRoomMapping {
    all h: Hospital |
        h.assigned in Patient -> lone Room
}


run {} for 1 Hospital, 3 Patient, 3 Room, 3 Doctor

check NoDoubleBooking for exactly 1 Hospital, 3 Patient, 3 Room

check SingleRoomPerPatient for exactly 1 Hospital, 3 Patient, 3 Room

check ValidRoomMapping for exactly 1 Hospital, 3 Patient, 3 Room
