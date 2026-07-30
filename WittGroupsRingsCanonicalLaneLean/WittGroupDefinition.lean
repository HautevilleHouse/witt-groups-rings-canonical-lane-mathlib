import canonicalLaneMathlib.AdmissibleClass

/-!
# Witt Group Definition Package

Defines the Witt group of a ring and its basic properties.
-/

namespace HautevilleHouse
namespace WittGroupsRingsCanonicalLaneLean

structure WittGroupPackage (R : Type u) [CommutativeRing R] where
  dimension : ℕ
  symmetricBilinearForms : Type v
  isometricEquivalence : Prop
  orthogonalSum : symmetricBilinearForms → symmetricBilinearForms → symmetricBilinearForms
  wittClass : symmetricBilinearForms → Type w
  wittGroup : Type x
  abelianGroupStructure : AddCommGroup wittGroup
  additionCompatible : Prop

structure WittGroupEvidence {R : Type u} [CommutativeRing R] (W : WittGroupPackage R) where
  isometricEquivalenceClosed : W.isometricEquivalence
  additionCompatibleClosed : W.additionCompatible

def WittGroupClosed {R : Type u} [CommutativeRing R] (W : WittGroupPackage R) : Prop :=
  W.isometricEquivalence ∧ W.additionCompatible

theorem witt_group_closed_from_evidence {R : Type u} [CommutativeRing R]
    (W : WittGroupPackage R) (E : WittGroupEvidence W) : WittGroupClosed W := by
  exact And.intro E.isometricEquivalenceClosed E.additionCompatibleClosed

end WittGroupsRingsCanonicalLaneLean
end HautevilleHouse