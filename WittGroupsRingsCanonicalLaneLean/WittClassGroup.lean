import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace WittGroupsRingsCanonicalLaneLean

structure WittClassGroup where
  baseField : Type u
  charNotTwo : baseField.char ≠ 2
  symmetricBilinearForms : Type v
  wittGroup : Type w
  hyperbolicForms : symmetricBilinearForms → Prop

structure WittClassGroupEvidence (W : WittClassGroup) where
  charNotTwoClosed : W.charNotTwo
  wittGroupDefined : Nonempty W.wittGroup
  hyperbolicFormsDecompose : ∀ (f : W.symmetricBilinearForms), W.hyperbolicForms f ∨ ¬ W.hyperbolicForms f

def WittClassGroupClosed (W : WittClassGroup) : Prop :=
  W.charNotTwo ∧ Nonempty W.wittGroup

theorem witt_class_group_closed_from_evidence (W : WittClassGroup) (E : WittClassGroupEvidence W) :
    WittClassGroupClosed W := by
  exact And.intro E.charNotTwoClosed E.wittGroupDefined

end WittGroupsRingsCanonicalLaneLean
end HautevilleHouse
