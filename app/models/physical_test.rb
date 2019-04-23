class PhysicalTest < ApplicationRecord
  belongs_to :user
  has_many :tests
  attr_accessor :username

  validates :suggested_program,
            :pull_ups,
            :pull_ups_form,
            :pull_ups_rom,
            :pull_ups_core,
            :pull_ups_rhythm,
            :push_ups,
            :push_ups_form,
            :push_ups_rom,
            :push_ups_core,
            :push_ups_rhythm,
            :squats,
            :squats_form,
            :squats_rom,
            :squats_core,
            :squats_rhythm,
            :crunches,
            :crunches_form,
            :crunches_rom,
            :crunches_core,
            :crunches_rhythm,
            presence: true

  enum suggested_program: [
    'AN',
    'PR',
    'PR-Cardio',
    'UBP',
    'MU',
    'MU-Cardio',
    'IN',
    'IN-Cardio',
    'AV',
    'Personalizado',
    'On-line pers.',
    'Otro'
  ]

  enum pull_ups_form: [
    'Completa',
    'Australiana'
  ], _suffix: :pull_ups

  enum pull_ups_rom: [
    'Ok',
    'Otra'
  ], _suffix: :pull_ups

  enum pull_ups_core: [
    'Involucra',
    'No Involucra',
  ], _suffix: :pull_ups

  enum pull_ups_rhythm: [
    'Continua',
    'Intermitente',
    'Descendiente'
  ], _suffix: :pull_ups

  enum push_ups_form: [
    'Completa',
    'Media'
  ], _suffix: :push_ups

  enum push_ups_rom: [
    'Ok',
    'Otra'
  ], _suffix: :push_ups

  enum push_ups_core: [
    'Involucra',
    'No Involucra',
  ], _suffix: :push_ups

  enum push_ups_rhythm: [
    'Continua',
    'Intermitente',
    'Descendiente'
  ], _suffix: :push_ups

  enum squats_form: [
    'Estabilidad rodillas',
    'Apoyando talón'
  ], _suffix: :squats

  enum squats_rom: [
    'Ok',
    'Otra'
  ], _suffix: :squats

  enum squats_core: [
    'Involucra',
    'No Involucra',
  ], _suffix: :squats

  enum squats_rhythm: [
    'Continua',
    'Intermitente',
    'Descendiente'
  ], _suffix: :squats

  enum crunches_form: [
    'Completa',
    'Asistida'
  ], _suffix: :crunches

  enum crunches_rom: [
    'Ok',
    'Otra'
  ], _suffix: :crunches

  enum crunches_core: [
    'No apalanca',
    'Apalanca'
  ], _suffix: :crunches

  enum crunches_rhythm: [
    'Continua',
    'Intermitente',
    'Descendiente'
  ], _suffix: :crunches
end
