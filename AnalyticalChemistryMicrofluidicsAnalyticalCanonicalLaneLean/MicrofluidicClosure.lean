import AnalyticalChemistryMicrofluidicsAnalyticalCanonicalLaneLean.FinalTheorem
import AnalyticalChemistryMicrofluidicsAnalyticalCanonicalLaneLean.MicrofluidicFlowLayer
import AnalyticalChemistryMicrofluidicsAnalyticalCanonicalLaneLean.SpeciesTransportLayer
import AnalyticalChemistryMicrofluidicsAnalyticalCanonicalLaneLean.ElectrokineticLayer

namespace HautevilleHouse
namespace AnalyticalChemistryMicrofluidicsAnalyticalCanonicalLaneLean

structure AdmittedMicrofluidicObject where
  flowModelChecked : Bool
  speciesTransportChecked : Bool
  electrokineticChecked : Bool
  classicalSourceBoundaryCarried : Bool

defaultAdmittedMicrofluidicObject : AdmittedMicrofluidicObject := {
  flowModelChecked := true,
  speciesTransportChecked := true,
  electrokineticChecked := true,
  classicalSourceBoundaryCarried := true
}

def ClassicalSourceBoundaryCarried : Prop :=
  defaultAdmittedMicrofluidicObject.classicalSourceBoundaryCarried = true

theorem classical_source_boundary_carried_checked : ClassicalSourceBoundaryCarried := by
  rfl

def microfluidicAdmissibleClass : MicrofluidicAdmissibleClass := {
  object := defaultAdmittedMicrofluidicObject,
  endpointSatisfied := MicrofluidicFlowLayerClosed defaultMicrofluidicFlowCertificate ∧
                        SpeciesTransportLayerClosed defaultSpeciesTransportCertificate ∧
                        ElectrokineticLayerClosed defaultElectrokineticCertificate,
  remainderRecorded := ClassicalSourceBoundaryCarried,
  gateWitness := Or.inl (by
    refine And.intro microfluidic_flow_layer_closed_checked ?_
    refine And.intro species_transport_layer_closed_checked electrokinetic_layer_closed_checked)
}

theorem microfluidic_admissible_closure_checked :
    ConstrainedMicrofluidicClosure microfluidicAdmissibleClass := by
  exact constrained_microfluidic_closure microfluidicAdmissibleClass

end AnalyticalChemistryMicrofluidicsAnalyticalCanonicalLaneLean
end HautevilleHouse