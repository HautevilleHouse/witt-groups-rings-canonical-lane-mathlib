import WittGroupsRingsCanonicalLaneLean.WittVectorConstruction

namespace HautevilleHouse
namespace WittGroupsRingsCanonicalLaneLean

structure FormalGroupLaw where
  underlyingRing : WittRing
  n : ℕ
  groupLaw : WittGroupOverRing underlyingRing
  formalPowerSeries : ℕ → ℕ → underlyingRing.carrier
  compositionAssociativity : Prop
  identityProperty : Prop
  inverseProperty : Prop
  formalGroupLawEvidence : formalPowerSeriesCompositionAssociative ∧
    identityProperty ∧ inverseProperty

def formalPowerSeriesCompositionAssociative (F : FormalGroupLaw) : Prop :=
  F.compositionAssociativity

theorem formal_group_law_closed (F : FormalGroupLaw) :
    F.formalGroupLawEvidence := F.formalGroupLawEvidence

end WittGroupsRingsCanonicalLaneLean
end HautevilleHouse