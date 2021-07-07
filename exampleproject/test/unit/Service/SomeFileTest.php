<?php
/**
 * Some file that does something.
 *
 * @author Floris Luiten <floris.luiten@tweakers.net>
 */

declare(strict_types=1);

namespace App\Service;

use PHPUnit\Framework\TestCase;

/**
 * Some file
 *
 * A controller that does something
 */
class SomeFileTest extends TestCase
{
    public function testSomeMethod(): void
    {
        $service = new SomeFile();

        self::assertSame(11, $service->someMethod('Hello world'));
    }
}
