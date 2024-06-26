# Project Overview: HiFiBerry Digi IO Streamer

## Introduction

The HiFiBerry Digi IO Streamer project facilitates audio streaming by capturing
TOSLINK audio from a HiFiBerry Digi IO sound card using ALSA. This audio is
then processed through Liquidsoap and broadcasted via Icecast.

![HifiBery IO Toslink Streamer](doc/hifiberry-io.jpg)

## DAC DSP vs. Digi IO Streamer

Consider opting for the HiFiBerry DAC DSP instead of the HiFiBerry Digi IO
Streamer for your project. The DAC DSP board is better suited when you need to
handle continuous audio signals with customizable settings.  Unlike the Digi IO
Streamer, which requires a steady signal with fixed configurations, the DAC DSP
offers greater flexibility and control over audio processing parameters, making
it more suitable for tailored audio applications.

## Components

- **ALSA Configuration**: Sets up hardware parameters and creates a virtual
  device for Liquidsoap.
- **Liquidsoap Script**: Handles audio input, fallback settings, metadata
  updates, and streaming to Icecast.
- **Icecast Configuration**: Manages server settings, client limits,
  authentication, and mount points for the audio stream.
- **Systemd Service**: Ensures the streaming service starts on boot, manages
  processes, and logs.
- **Log Rotation**: Rotates logs daily, compresses old logs, and ensures
  uninterrupted logging.

## Summary

This project integrates hardware and software components to create a robust
audio streaming solution. ALSA captures audio, Liquidsoap processes and streams
it, and Icecast serves the stream to listeners. Systemd ensures reliability,
and log rotation manages logging efficiently.

## Specific Advice on Changing Passwords for Network, Icecast, and Liquidsoap

### Network Devices and Services

- **Router and Devices**: Change router admin passwords and update Wi-Fi
  credentials for security.

### Icecast Configuration

- **Icecast**: Update passwords in `icecast.xml` for `<source-password>`,
  `<relay-password>`, and `<admin-password>`.

### Liquidsoap Configuration

- **Liquidsoap**: Update passwords in `streamer.liq` for any credentials used
  in scripts or configurations.

