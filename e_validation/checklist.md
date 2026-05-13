# Hospital Management System

# E. VALIDATION & SECURITY

## 1. Measurable Validation Criteria

| Expectation                 | Measurable Criteria                                                                         |
| --------------------------- | ------------------------------------------------------------------------------------------- |
| Secure authentication       | Login success only for valid credentials with role-based access control enabled             |
| System performance          | Response time ≤ 2 seconds for patient, doctor, and room operations                          |
| Data consistency            | Patient–doctor–room relationships remain consistent with no orphan or duplicate assignments |
| Room allocation correctness | Each room holds maximum 1 patient at any time (1:1 constraint enforced)                     |
| Emergency handling          | Critical patient marked and processed within ≤ 1 minute of detection                        |
| Billing accuracy            | Billing records generated with 100% consistency based on patient stay and services          |
| Audit logging               | 100% of critical actions logged with timestamp, user role, and operation type               |
| System availability         | Core system remains operational during concurrent user access without data loss             |
| Access control              | Unauthorized users cannot access restricted modules                                         |
| CI validation               | All automated tests pass successfully in GitHub Actions pipeline                            |

---

## 2. Validation Checklist

| ID  | Requirement            | Validation Criteria                                                      | Method            | Status  |
| --- | ---------------------- | ------------------------------------------------------------------------ | ----------------- | ------- |
| 1   | User Login             | Role-based authentication works correctly and rejects invalid access     | Testing           | Pending |
| 2   | Patient Registration   | Patient data is stored without duplication and with required fields      | Testing           | Pending |
| 3   | Doctor Assignment      | Only registered doctors can be assigned to valid patients                | Testing           | Pending |
| 4   | Room Allocation        | One patient per room constraint is strictly enforced                     | Testing           | Pending |
| 5   | Admission/Discharge    | Patient state changes correctly update room availability                 | Testing           | Pending |
| 6   | Billing System         | Billing is generated accurately based on defined rules                   | Testing           | Pending |
| 7   | Emergency Handling     | Critical patients are prioritized in allocation and logged               | Inspection        | Pending |
| 8   | Audit Logging          | All critical actions are recorded with full traceability                 | Inspection        | Pending |
| 9   | Data Consistency       | No inconsistent or orphan records exist in system relations              | Testing           | Pending |
| 10  | System Security        | Unauthorized access attempts are blocked successfully                    | Security Testing  | Pending |
| 11  | Access Control         | Users can access only permitted modules based on role                    | Inspection        | Pending |
| 12  | CI Pipeline Validation | GitHub Actions workflow executes successfully without build/test failure | Automated Testing | Pending |

---

The validation process ensures that all functional and non-functional requirements of the Hospital Management System are testable, measurable, and traceable. Security validation and CI pipeline automation using GitHub Actions help maintain system reliability, consistency, and controlled access throughout the development lifecycle.
