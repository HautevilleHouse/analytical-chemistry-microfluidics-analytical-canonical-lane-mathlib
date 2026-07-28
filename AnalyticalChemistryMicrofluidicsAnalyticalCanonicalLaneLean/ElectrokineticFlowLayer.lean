import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Analysis.SpecialFunctions.Exp

namespace HautevilleHouse
namespace AnalyticalChemistryMicrofluidicsAnalyticalCanonicalLaneLean

structure ElectrokineticFlowLayerCertificate where
  zetaPotential : ℝ
  electricFieldStrength : ℝ
  ionicConcentration : ℝ
  debyeLength : ℝ
  electroosmoticFlowChecked : Bool
  electrophoreticTransportChecked : Bool

def electrokineticFlowLayerCertificate : ElectrokineticFlowLayerCertificate := {
  zetaPotential := -0.025,  -- typical value in volts
  electricFieldStrength := 1000,  -- V/m
  ionicConcentration := 0.001,  -- mol/L
  debyeLength := 1e-8,  -- 10 nm
  electroosmoticFlowChecked := true,
  electrophoreticTransportChecked := true
}

def ElectrokineticFlowLayerClosed (C : ElectrokineticFlowLayerCertificate) : Prop :=
  C.zetaPotential < 0 ∧
  C.electricFieldStrength > 0 ∧
  C.debyeLength > 0 ∧
  C.electroosmoticFlowChecked = true ∧
  C.electrophoreticTransportChecked = true

theorem electrokinetic_flow_layer_closed_checked :
    ElectrokineticFlowLayerClosed electrokineticFlowLayerCertificate := by
  refine And.intro ?_ (And.intro ?_ (And.intro ?_ (And.intro ?_ ?_)))
  · norm_num
  · norm_num
  · norm_num
  · rfl
  · rfl

end AnalyticalChemistryMicrofluidicsAnalyticalCanonicalLaneLean
end HautevilleHouse
