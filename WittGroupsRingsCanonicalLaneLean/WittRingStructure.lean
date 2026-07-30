import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace WittGroupsRingsCanonicalLaneLean

structure WittRingStructure where
  ringCarrier : Type u
  addition : ringCarrier → ringCarrier → ringCarrier
  multiplication : ringCarrier → ringCarrier → ringCarrier
  wittAdditionDefined : Prop
  wittMultiplicationDefined : Prop
  ringAxioms : Prop

structure WittRingEvidence (R : WittRingStructure) where
  wittAdditionDefinedClosed : R.wittAdditionDefined
  wittMultiplicationDefinedClosed : R.wittMultiplicationDefined
  ringAxiomsClosed : R.ringAxioms

def WittRingClosed (R : WittRingStructure) : Prop :=
  R.wittAdditionDefined ∧ R.wittMultiplicationDefined ∧ R.ringAxioms

theorem witt_ring_closed_from_evidence (R : WittRingStructure) (E : WittRingEvidence R) :
    WittRingClosed R := by
  exact And.intro E.wittAdditionDefinedClosed (And.intro E.wittMultiplicationDefinedClosed E.ringAxiomsClosed)

end WittGroupsRingsCanonicalLaneLean
end HautevilleHouse
