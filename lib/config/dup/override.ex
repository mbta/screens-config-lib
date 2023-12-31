defmodule ScreensConfig.Dup.Override do
  @moduledoc false

  alias ScreensConfig.Dup.Override.{FullscreenAlert, FullscreenImage, PartialAlertList}

  @type screen0 :: PartialAlertList.t() | FullscreenAlert.t() | FullscreenImage.t() | nil
  @type screen1 :: FullscreenAlert.t() | FullscreenImage.t() | nil
  @type screen2 :: PartialAlertList.t() | nil

  def screen0_from_json(%{"type" => "partial"} = json) do
    PartialAlertList.from_json(json)
  end

  def screen0_from_json(%{"type" => "fullscreen"} = json) do
    FullscreenAlert.from_json(json)
  end

  def screen0_from_json(%{"type" => "image"} = json) do
    FullscreenImage.from_json(json)
  end

  def screen0_from_json(_) do
    nil
  end

  def screen1_from_json(%{"type" => "fullscreen"} = json) do
    FullscreenAlert.from_json(json)
  end

  def screen1_from_json(%{"type" => "image"} = json) do
    FullscreenImage.from_json(json)
  end

  def screen1_from_json(_) do
    nil
  end

  def screen2_from_json(%{"type" => "partial"} = json) do
    PartialAlertList.from_json(json)
  end

  def screen2_from_json(_) do
    nil
  end

  def screen0_to_json(%PartialAlertList{} = screen0) do
    PartialAlertList.to_json(screen0)
  end

  def screen0_to_json(%FullscreenAlert{} = screen0) do
    FullscreenAlert.to_json(screen0)
  end

  def screen0_to_json(%FullscreenImage{} = screen0) do
    FullscreenImage.to_json(screen0)
  end

  def screen0_to_json(_) do
    nil
  end

  def screen1_to_json(%FullscreenAlert{} = screen1) do
    FullscreenAlert.to_json(screen1)
  end

  def screen1_to_json(%FullscreenImage{} = screen1) do
    FullscreenImage.to_json(screen1)
  end

  def screen1_to_json(_) do
    nil
  end

  def screen2_to_json(%PartialAlertList{} = screen2) do
    PartialAlertList.to_json(screen2)
  end

  def screen2_to_json(_) do
    nil
  end
end
