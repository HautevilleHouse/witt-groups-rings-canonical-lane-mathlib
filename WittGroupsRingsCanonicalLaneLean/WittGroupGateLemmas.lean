import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace WittGroupsRingsCanonicalLaneLean

def gateClosed (A : WittAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : WittAdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end WittGroupsRingsCanonicalLaneLean
end HautevilleHouse