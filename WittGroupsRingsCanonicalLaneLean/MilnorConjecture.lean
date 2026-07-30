import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.WittGroupsRingsCanonicalLaneLean.WittRingDefinition
import HautevilleHouse.WittGroupsRingsCanonicalLaneLean.PfisterForms

/-!
# Milnor Conjecture Package

Encodes the Milnor conjecture relating Milnor K-theory and Witt groups.
-/

namespace HautevilleHouse
namespace WittGroupsRingsCanonicalLaneLean

structure MilnorConjecturePackage (F : Type u) [Field F] where
  milnorKTheory : Type u
  wittRing : WittRingPackage F
  pfisterForm : PfisterFormPackage F
  isomorphism : Prop
  symbolMap : milnorKTheory → wittRing.wittGroup.wittGroup
  isomorphismTerm : isomorphism

structure MilnorConjectureEvidence {F : Type u} [Field F]
    (M : MilnorConjecturePackage F) where
  isomorphismClosed : M.isomorphism

def MilnorConjectureClosed {F : Type u} [Field F] (M : MilnorConjecturePackage F) : Prop :=
  WittRingClosed M.wittRing ∧ PfisterFormClosed M.pfisterForm ∧ M.isomorphism

theorem milnor_conjecture_closed_from_evidence {F : Type u} [Field F]
    (M : MilnorConjecturePackage F) (E : MilnorConjectureEvidence M) : MilnorConjectureClosed M := by
  have wittClosed : WittRingClosed M.wittRing := witt_ring_closed_from_evidence M.wittRing
    { multiplicationCompatibleClosed := M.wittRing.multiplicationCompatible }
  have pfisterClosed : PfisterFormClosed M.pfisterForm := pfister_form_closed_from_evidence
    M.pfisterForm (by
      exact { multiplicativePropertyClosed := M.pfisterForm.multiplicativeProperty,
              normFormClosed := M.pfisterForm.normForm,
              symbolEquivalenceClosed := M.pfisterForm.symbolEquivalence })
  exact And.intro wittClosed (And.intro pfisterClosed E.isomorphismClosed)

end WittGroupsRingsCanonicalLaneLean
end HautevilleHouse