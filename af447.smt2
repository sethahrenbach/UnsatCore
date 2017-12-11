;; Air France 447 Case
(set-option :produce-unsat-cores true)

;; right side instruments
(declare-const right-airspeed Int)
(declare-const right-pitch Int)
(declare-const right-bank Int)

;; middle instruments
(declare-const middle-airspeed Int)
(declare-const middle-pitch Int)
(declare-const middle-bank Int)

;; left side instruments
(declare-const left-airspeed Int)
(declare-const left-pitch Int)
(declare-const left-bank Int)

;; actual instrument readings
(assert (!(= left-airspeed 135) :named lair))
(assert (!(= right-airspeed 100) :named rair))
(assert (!(= middle-airspeed 100) :named mair))
(assert (!(= right-pitch 15) :named rpitch))
(assert (!(= middle-pitch 15) :named mpitch))
(assert (!(= left-pitch 15) :named lpitch))
(assert (!(= right-bank 0) :named rbank))
(assert (!(= middle-bank 0) :named mbank))
(assert (!(= left-bank 0) :named lbank))

;; safety precondition of action: Hard Nose Up
(assert (= left-airspeed right-airspeed))
(assert (= left-airspeed middle-airspeed))
(assert (= middle-airspeed right-airspeed))
(assert (= right-pitch left-pitch))
(assert (= right-pitch middle-pitch))
(assert (= middle-pitch left-pitch))
(assert (< right-airspeed 700))
(assert (> right-airspeed 99))
(assert (< middle-airspeed 700))
(assert (> middle-airspeed 99))
(assert (< left-airspeed 700))
(assert (> left-airspeed 99))


(check-sat)
(get-unsat-core)