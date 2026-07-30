import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace WittGroupsRingsCanonicalLaneLean

structure AdditionFormulas (K : Type) [Field K] where
  sumWitt : ∀ n, WittVector K n → WittVector K n → WittVector K n
  sumGhostCompatible : ∀ n a b, ghostMap n (sumWitt n a b) = ghostMap n a + ghostMap n b

structure MultiplicationFormulas (K : Type) [Field K] where
  prodWitt : ∀ n, WittVector K n → WittVector K n → WittVector K n
  prodGhostCompatible : ∀ n a b, ghostMap n (prodWitt n a b) = ghostMap n a * ghostMap n b

end WittGroupsRingsCanonicalLaneLean
end HautevilleHouse