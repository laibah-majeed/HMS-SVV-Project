# Software Requirement Specification of Hospital Management System

# A. REQUIREMENT ENGINEERING

## System Overview

The Requirement Engineering phase defines, analyzes, and documents all functional and non-functional requirements for the Hospital Management System (HMS), ensuring requirements are complete, consistent, verifiable, and traceable, with deliverables including the Software Requirements Specification (SRS), Requirement Defect Taxonomy Table, and GitHub Issues Tracking Log, while using Git and GitHub for version control and traceability throughout the development lifecycle; the HMS is a secure, role-based system designed to manage hospital operations such as patient management, doctor assignment, room allocation, admissions, discharges, medical records, billing, and emergency handling, supporting Admin, Doctor, Nurse, and Receptionist roles to ensure accurate data management, efficient workflow, and reliable handling of both routine and emergency operations.

---

# A1. SOFTWARE REQUIREMENTS SPECIFICATION (SRS)

## 1. Functional Requirements

| Req ID | Requirement                                                                                                                    |
| ------ | ------------------------------------------------------------------------------------------------------------------------------ |
| FR1    | The system shall support secure user authentication with role-based access control for Admin, Doctor, Nurse, and Receptionist. |
| FR2    | The system shall allow registration, update, and management of patient records.                                                |
| FR3    | The system shall assign doctors to registered patients based on defined hospital rules.                                        |
| FR4    | The system shall allocate rooms to patients with a constraint of one patient per room.                                         |
| FR5    | The system shall manage patient admission process in the system.                                                               |
| FR6    | The system shall manage patient discharge process and automatically free the assigned room.                                    |
| FR7    | The system shall support assignment of doctors to patients based on system rules.                                              |
| FR8    | The system shall generate billing records based on patient services and hospital stay.                                         |
| FR9    | The system shall maintain complete medical history and treatment records for each patient.                                     |
| FR10   | The system shall handle emergency cases, including prioritization of critical patients for immediate attention.                |

---

## 2. Non-Functional Requirements

| Req ID | Requirement                                                                         |
| ------ | ----------------------------------------------------------------------------------- |
| NFR1   | The system shall enforce secure authentication and role-based access control.       |
| NFR2   | The system shall ensure data consistency across patient, doctor, and room entities. |
| NFR3   | The system shall ensure high availability during emergency operations.              |
| NFR4   | The system shall maintain audit logs of all critical actions.                       |
| NFR5   | The system shall ensure acceptable response time for all operations.                |

---

## 3. System Users

- Admin: Full control over system configuration, users, and hospital data.
- Doctor: Responsible for diagnosis, treatment, and updating patient medical records.
- Nurse: Responsible for patient care and monitoring assigned patients.
- Receptionist: Responsible for patient registration, admission, and administrative tasks.
