import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace WittGroupsRingsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  WittRingClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact trivial

end WittGroupsRingsCanonicalLaneLean
end HautevilleHouse