import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace WittGroupsRingsCanonicalLaneLean

structure WittRingOperations (R : Type) [CommRing R] where
  additionPolynomials : ℕ → ℕ → (R[X,Y])
  multiplicationPolynomials : ℕ → ℕ → (R[X,Y])
  frobeniusPolynomials : ℕ → (R[X])
  restrictionPolynomials : ℕ → ℕ → (R[X])
  additionPolynomialsDefined : Prop
  multiplicationPolynomialsDefined : Prop
  frobeniusPolynomialsDefined : Prop
  restrictionPolynomialsDefined : Prop

structure WittRingOperationsEvidence (O : WittRingOperations ℤ) where
  additionPolynomialsDefinedClosed : O.additionPolynomialsDefined
  multiplicationPolynomialsDefinedClosed : O.multiplicationPolynomialsDefined
  frobeniusPolynomialsDefinedClosed : O.frobeniusPolynomialsDefined
  restrictionPolynomialsDefinedClosed : O.restrictionPolynomialsDefined

def WittRingOperationsClosed (O : WittRingOperations ℤ) : Prop :=
  O.additionPolynomialsDefined ∧ O.multiplicationPolynomialsDefined ∧ O.frobeniusPolynomialsDefined ∧ O.restrictionPolynomialsDefined

theorem witt_ring_operations_closed_from_evidence
    (O : WittRingOperations ℤ) (E : WittRingOperationsEvidence O) : WittRingOperationsClosed O := by
  exact And.intro E.additionPolynomialsDefinedClosed
    (And.intro E.multiplicationPolynomialsDefinedClosed
      (And.intro E.frobeniusPolynomialsDefinedClosed E.restrictionPolynomialsDefinedClosed))

end WittGroupsRingsCanonicalLaneLean
end HautevilleHouse