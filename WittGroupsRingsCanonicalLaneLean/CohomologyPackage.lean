import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.WittGroupsRingsCanonicalLaneLean.WittGroupRingDefs

namespace HautevilleHouse
namespace WittGroupsRingsCanonicalLaneLean

structure WittCohomologyPackage (p : ℕ) (R : Type u) [CommRing R] where
  cohomologyRing : Ring
  coefficientRing : Type v
  spectralSequence : Type w
  convergence : Prop
  differentials : Prop

structure WittCohomologyEvidence (p : ℕ) (R : Type u) [CommRing R] (C : WittCohomologyPackage p R) where
  convergenceClosed : C.convergence
  differentialsClosed : C.differentials

def WittCohomologyClosed (p : ℕ) (R : Type u) [CommRing R] (C : WittCohomologyPackage p R) : Prop :=
  C.convergence ∧ C.differentials

theorem witt_cohomology_closed_from_evidence (p : ℕ) (R : Type u) [CommRing R] (C : WittCohomologyPackage p R) (E : WittCohomologyEvidence p R C) : WittCohomologyClosed p R C := by
  exact And.intro E.convergenceClosed E.differentialsClosed

end WittGroupsRingsCanonicalLaneLean
end HautevilleHouse