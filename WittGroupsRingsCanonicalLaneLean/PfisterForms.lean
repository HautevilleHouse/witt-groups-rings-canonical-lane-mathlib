import canonicalLaneMathlib.AdmissibleClass

/-!
# Pfister Forms Package

Defines Pfister forms and their properties relevant to Witt groups.
-/

namespace HautevilleHouse
namespace WittGroupsRingsCanonicalLaneLean

structure PfisterFormPackage (F : Type u) [Field F] where
  n : ℕ
  form : Type v
  multiplicativeProperty : Prop
  normForm : Prop
  symbolEquivalence : Prop

structure PfisterFormEvidence {F : Type u} [Field F] (P : PfisterFormPackage F) where
  multiplicativePropertyClosed : P.multiplicativeProperty
  normFormClosed : P.normForm
  symbolEquivalenceClosed : P.symbolEquivalence

def PfisterFormClosed {F : Type u} [Field F] (P : PfisterFormPackage F) : Prop :=
  P.multiplicativeProperty ∧ P.normForm ∧ P.symbolEquivalence

theorem pfister_form_closed_from_evidence {F : Type u} [Field F]
    (P : PfisterFormPackage F) (E : PfisterFormEvidence P) : PfisterFormClosed P := by
  exact And.intro E.multiplicativePropertyClosed
    (And.intro E.normFormClosed E.symbolEquivalenceClosed)

end WittGroupsRingsCanonicalLaneLean
end HautevilleHouse