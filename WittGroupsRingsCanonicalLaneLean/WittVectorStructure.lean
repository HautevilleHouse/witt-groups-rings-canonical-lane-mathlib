import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace WittGroupsRingsCanonicalLaneLean

structure WittVector (n : ℕ) (R : Type) [CommRing R] where
  entries : ℕ → R
  ghostComponents : ℕ → R

structure WittVectorStructure where
  dimension : ℕ
  baseRing : Type
  [commRing : CommRing baseRing]
  frobeniusEndomorphism : WittVector dimension baseRing → WittVector dimension baseRing
  teichmullerRep : baseRing → WittVector dimension baseRing
  additionDefined : Prop
  multiplicationDefined : Prop
  frobeniusDefined : Prop
  restrictionMapDefined : Prop

structure WittVectorEvidence (W : WittVectorStructure) where
  additionDefinedClosed : W.additionDefined
  multiplicationDefinedClosed : W.multiplicationDefined
  frobeniusDefinedClosed : W.frobeniusDefined
  restrictionMapDefinedClosed : W.restrictionMapDefined

def WittVectorStructureClosed (W : WittVectorStructure) : Prop :=
  W.additionDefined ∧ W.multiplicationDefined ∧ W.frobeniusDefined ∧ W.restrictionMapDefined

theorem witt_vector_structure_closed_from_evidence
    (W : WittVectorStructure) (E : WittVectorEvidence W) : WittVectorStructureClosed W := by
  exact And.intro E.additionDefinedClosed
    (And.intro E.multiplicationDefinedClosed
      (And.intro E.frobeniusDefinedClosed E.restrictionMapDefinedClosed))

end WittGroupsRingsCanonicalLaneLean
end HautevilleHouse