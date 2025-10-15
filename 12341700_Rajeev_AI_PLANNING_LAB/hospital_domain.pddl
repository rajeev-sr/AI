(define (domain hospital-emergency)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    ambulance patient location
    hospital - location
  )

  (:predicates
    (at ?a - ambulance ?l - location)
    (patient-at ?p - patient ?l - location)
    (in-ambulance ?p - patient ?a - ambulance)
    (connected ?l1 - location ?l2 - location)
    (blocked ?l1 - location ?l2 - location)
    (empty ?a - ambulance)
  )

  ;; --- ACTION: MOVE ---
  (:action move
    :parameters (?a - ambulance ?from - location ?to - location)
    :precondition (and
      (at ?a ?from)
      (connected ?from ?to)
      (not (blocked ?from ?to))
    )
    :effect (and
      (at ?a ?to)
      (not (at ?a ?from))
    )
  )

  ;; --- ACTION: PICKUP-PATIENT ---
  (:action pickup-patient
    :parameters (?p - patient ?a - ambulance ?l - location)
    :precondition (and
      (at ?a ?l)
      (patient-at ?p ?l)
      (empty ?a)
    )
    :effect (and
      (in-ambulance ?p ?a)
      (not (patient-at ?p ?l))
      (not (empty ?a))
    )
  )

  ;; --- ACTION: DROPOFF-PATIENT ---
  (:action dropoff-patient
    :parameters (?p - patient ?a - ambulance ?h - hospital)
    :precondition (and
      (at ?a ?h)
      (in-ambulance ?p ?a)
    )
    :effect (and
      (patient-at ?p ?h)
      (empty ?a)
      (not (in-ambulance ?p ?a))
    )
  )
)

