import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace WittGroupsRingsCanonicalLaneLean

structure WittGroup (R : Type) [CommRing R] where
  underlyingSet : Type
  groupMultiplication : underlyingSet → underlyingSet → underlyingSet
  groupIdentity : underlyingSet
  groupInverse : underlyingSet → underlyingSet

structure WittGroupStructure where
  coefficientRing : Type
  [commRing : CommRing coefficientRing]
  additionFormula : Prop
  exponentialSeriesDefined : Prop
  formalGroupLaw : Prop
  coordinateChangeIsomorphism : Prop

structure WittGroupEvidence (G : WittGroupStructure) where
  additionFormulaClosed : G.additionFormula
  exponentialSeriesDefinedClosed : G.exponentialSeriesDefined
  formalGroupLawClosed : G.formalGroupLaw
  coordinateChangeIsomorphismClosed : G.coordinateChangeIsomorphism

def WittGroupStructureClosed (G : WittGroupStructure) : Prop :=
  G.additionFormula ∧ G.exponentialSeriesDefined ∧ G.formalGroupLaw ∧ G.coordinateChangeIsomorphism

theorem witt_group_structure_closed_from_evidence
    (G : WittGroupStructure) (E : WittGroupEvidence G) : WittGroupStructureClosed G := by
  exact And.intro E.additionFormulaClosed
    (And.intro E.exponentialSeriesDefinedClosed
      (And.intro E.formalGroupLawClosed E.coordinateChangeIsomorphismClosed))

end WittGroupsRingsCanonicalLaneLean
end HautevilleHouse