# Adaptive-Noise-Cancellation-using-LMS-Algorithm
The objective is to remove the noise from a corrupted speech signal using LMS adaptive filtering.
In many cases where much of the noise specifications are not given an adaptive filtering approach is used to denoise the corrupted signal.
In adaptive algorithm the corrupted noise is used as primary input(desired signal). And a noise signal(which is someway correlated with the noise present in the corrupted speech) is given as a reference signal. The reference signal is then passed through an adaptive filter, the coefficients of which are adjusted in order to obtain a minimized error.

The same algoriithm can also be applied for system identification, where the clean speech is used as reference signal and the noise is extracted as output.

In case the noise signal is not available, we can go for system identification and then the extracted noise can be subtracted from the corrupted speech signal either in frequency domain or in time domain(provided the lengths must be the same).
