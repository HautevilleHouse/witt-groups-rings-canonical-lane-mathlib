import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.WittGroupsRingsCanonicalLaneLean.WittGroupRingDefs

namespace HautevilleHouse
namespace WittGroupsRingsCanonicalLaneLean

structure WittReciprocityPackage (p : ℕ) (R : Type u) [CommRing R] where
  normResidueSymbol : GroupHom (Units R) (Units (WittVectorRing p R))
  hilbertSymbol : (Units R) → (Units R) → Prop
  reciprocityLaw : Prop
  explicitFormula : Prop

structure WittReciprocityEvidence (p : ℕ) (R : Type u) [CommRing R] (W : WittReciprocityPackage p R) where
  reciprocityLawClosed : W.reciprocityLaw
  explicitFormulaClosed : W.explicitFormula

def WittReciprocityClosed (p : ℕ) (R : Type u) [CommRing R] (W : WittReciprocityPackage p R) : Prop :=
  W.reciprocityLaw ∧ W.explicitFormula

theorem witt_reciprocity_closed_from_evidence (p : ℕ) (R : Type u) [CommRing R] (W : WittReciprocityPackage p R) (E : WittReciprocityEvidence p R W) : WittReciprocityClosed p R W := by
  exact And.intro E.reciprocityLawClosed E.explicitFormulaClosed

end WittGroupsRingsCanonicalLaneLean
end HautevilleHouse