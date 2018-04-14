(ns nal-clj.core)

(defn foo
  "I don't do a whole lot."
  [x]
  (println x "Hello, World!"))

(defn -main []
  (println (format "Hello, %s" "microamp!")))
