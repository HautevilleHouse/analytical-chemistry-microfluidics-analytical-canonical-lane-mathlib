import canonicalLaneMathlib.AdmissibleClass
import AnalyticalChemistryMicrofluidicsAnalyticalCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistryMicrofluidicsAnalyticalCanonicalLaneLean

def bridgeClosed (O : AdmittedMicrofluidicObject) : Prop :=
  O.flowModelChecked ∧ O.speciesTransportChecked ∧ O.electrokineticChecked

theorem bridge_from_admissible_class (A : MicrofluidicAdmissibleClass) : bridgeClosed A.object := by
  exact ⟨A.object.flowModelChecked, A.object.speciesTransportChecked, A.object.electrokineticChecked⟩

def gateClosed (A : MicrofluidicAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : MicrofluidicAdmissibleClass) : gateClosed A :=
  A.gateWitness

end AnalyticalChemistryMicrofluidicsAnalyticalCanonicalLaneLean
end HautevilleHouse