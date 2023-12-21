-- models/your_model.sql


    SELECT
        case_id,
        email,
        patient_id,
        age,
        state,
        {{ coalesce_case_status() }} AS case_status,
        {{ coalesce_language() }} AS preffered_language,
        review AS ratings,
        SPLIT(doctor_id, '|')[0] AS doctor_id,
        SPLIT(doctor_id, '|')[1] AS department_id,
        SPLIT(doctor_id, '|')[2] AS hospital_id
     FROM {{ source('sources_case', 'case_status') }}



