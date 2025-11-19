;; Samcoin fungible token implementation

(define-fungible-token samcoin)

(define-data-var contract-owner principal tx-sender)

(define-constant ERR-UNAUTHORIZED (err u100))

(define-read-only (get-owner)
  (ok (var-get contract-owner)))

(define-public (transfer (amount uint) (recipient principal))
  (ft-transfer? samcoin amount tx-sender recipient))

(define-public (mint (amount uint) (recipient principal))
  (if (is-eq tx-sender (var-get contract-owner))
      (ft-mint? samcoin amount recipient)
      ERR-UNAUTHORIZED))

(define-read-only (get-balance (who principal))
  (ok (ft-get-balance samcoin who)))

(define-read-only (get-total-supply)
  (ok (ft-get-supply samcoin)))
