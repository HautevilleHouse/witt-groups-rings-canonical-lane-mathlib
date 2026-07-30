import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace WittGroupsRingsCanonicalLaneLean

-- Final theorem: constrained closure
def ConstrainedWittClosure (A : WittAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_witt_endgame (A : WittAdmissibleClass) : ConstrainedWittClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end WittGroupsRingsCanonicalLaneLean
end HautevilleHouse