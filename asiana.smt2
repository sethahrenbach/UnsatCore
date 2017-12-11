;; Asiana 214 Case
(set-option :produce-unsat-cores true)

;; global state
(declare-const autothrottle Bool)

;; right side instruments
(declare-const right-airspeed Int)
(declare-const right-pitch Int)
(declare-const right-bank Int)
(declare-const right-alt Int)

;; middle instruments
(declare-const middle-airspeed Int)
(declare-const middle-pitch Int)
(declare-const middle-bank Int)
(declare-const middle-alt Int)

;; left side instruments
(declare-const left-airspeed Int)
(declare-const left-pitch Int)
(declare-const left-bank Int)
(declare-const left-alt Int)

;; actual instrument readings
(assert (!(= autothrottle false) :named at-status))
(assert (!(< right-alt 10000) :named ralt))
(assert (!(< middle-alt 10000) :named malt))
(assert (!(< left-alt 10000) :named lalt))

(assert (!(= left-airspeed 135) :named lair))
(assert (!(= right-airspeed 135) :named rair))
(assert (!(= middle-airspeed 135) :named mair))
(assert (!(= right-pitch 15) :named rpitch))
(assert (!(= middle-pitch 15) :named mpitch))
(assert (!(= left-pitch 15) :named lpitch))
(assert (!(= right-bank -15) :named rbank))
(assert (!(= middle-bank 0) :named mbank))
(assert (!(= left-bank 0) :named lbank))

;; safety precondition of action: Hard Nose Down
(assert (= left-alt right-alt))
(assert (= left-alt middle-alt))
(assert (= middle-alt right-alt))
(assert (= left-airspeed right-airspeed))
(assert (= left-airspeed middle-airspeed))
(assert (= middle-airspeed right-airspeed))
(assert (or (> right-alt 10000) (= autothrottle true)))


(check-sat)
(get-unsat-core)