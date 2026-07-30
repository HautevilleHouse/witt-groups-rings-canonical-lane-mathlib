import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.WittGroupsRingsCanonicalLaneLean.WittGroupDefinition

/-!
# Witt Ring Definition Package

Defines the Witt ring of a field, combining the Witt group with multiplication.
-/

namespace HautevilleHouse
namespace WittGroupsRingsCanonicalLaneLean

structure WittRingPackage (F : Type u) [Field F] where
  wittGroup : WittGroupPackage F
  tensorProduct : wittGroup.symmetricBilinearForms → wittGroup.symmetricBilinearForms → wittGroup.symmetricBilinearForms
  multiplication : wittGroup.wittGroup → wittGroup.wittGroup → wittGroup.wittGroup
  ringStructure : CommRing wittGroup.wittGroup
  multiplicationCompatible : Prop

structure WittRingEvidence {F : Type u} [Field F] (R : WittRingPackage F) where
  multiplicationCompatibleClosed : R.multiplicationCompatible

def WittRingClosed {F : Type u} [Field F] (R : WittRingPackage F) : Prop :=
  WittGroupClosed R.wittGroup ∧ R.multiplicationCompatible

theorem witt_ring_closed_from_evidence {F : Type u} [Field F]
    (R : WittRingPackage F) (E : WittRingEvidence R) : WittRingClosed R := by
  exact And.intro (witt_group_closed_from_evidence R.wittGroup (by
    exact { isometricEquivalenceClosed := R.wittGroup.isometricEquivalence,
            additionCompatibleClosed := R.wittGroup.additionCompatible }))
    E.multiplicationCompatibleClosed

end WittGroupsRingsCanonicalLaneLean
end HautevilleHouse