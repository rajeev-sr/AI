(define (problem hospital-emergency-problem)
  (:domain hospital-emergency)

  (:objects
    a1 a2 - ambulance
    p1 p2 p3 - patient
    loc1 loc2 loc3 - location
    h1 h2 - hospital
  )

  (:init
    ;; Define bidirectional connectivity between locations
    (connected h1 loc1)
    (connected loc1 h1)
    (connected loc1 loc2)
    (connected loc2 loc1)
    (connected loc2 loc3)
    (connected loc3 loc2)
    (connected loc3 h2)
    (connected h2 loc3)
    (connected h1 h2)
    (connected h2 h1)

    ;; Initial positions of ambulances
    (at a1 h1)
    (at a2 h2)

    ;; Patients at various locations
    (patient-at p1 loc1)
    (patient-at p2 loc2)
    (patient-at p3 loc3)

    ;; Ambulances are initially empty
    (empty a1)
    (empty a2)
  )

  (:goal (and
    (patient-at p1 h1)
    (patient-at p2 h2)
    (patient-at p3 h1)
  ))
)

